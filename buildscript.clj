#!/usr/bin/env bb
(ns buildscript
  (:require [clojure.string :as str]
            [clojure.java.io :as io])
  (:import (java.util.zip ZipOutputStream
                          ZipEntry)))

(def game-name "Banana-TV")

(def src-folder (io/file "./src"))
(def release-folder (io/file "./dist"))

(def love-win64 (io/file "./lovefiles/love-0.9.2-win64"))


;; file IO utility functions

(def fname #(.getName %))

(defn concat-files
  [a b target]
  (with-open [out (io/output-stream target)]
    (io/copy a out)
    (io/copy b out)
    (.flush out)))


(defn copy!
      [src target]
      (if (.isDirectory src)
        (do
          (when-not (.exists target)
        (.mkdirs target))
          (doseq [child (.listFiles src)]
                 (copy! child (io/file target (fname child)))))
        (io/copy src target)))


(defn delete!
      [file]
      (when (.isDirectory file)
    (doseq [file-in-dir (.listFiles file)]
      (delete! file-in-dir)))
      (io/delete-file file))


;; zip utility functions

(defn zip-entry
  [folder file]
  (ZipEntry. (str (.relativize (.toPath folder) (.toPath file)))))

(defn generate-file-tree
  [node]
  (cond
    (.isFile node) node
    (.isDirectory node) (map generate-file-tree (.listFiles node))))

(defn collect-files
  [folder]
  (->> folder
       generate-file-tree
       flatten))

(defn create-zip-file!
  [folder target-file]
  (println "Zip output:" (.getCanonicalPath target-file))
  (with-open [fos (io/output-stream target-file)
              zos (ZipOutputStream. fos)]
    ;; write zip entries
    (doseq [file (collect-files folder)]
           (when (= file target-file)
        (throw (Exception. "trying to zip itself")))
           (.putNextEntry zos (zip-entry folder file))
           (io/copy file zos :buffer-size 16384))
    (.closeEntry zos)))



(println "=== CREATING DISTRIBUTION FILES ===")
(println)


;; clear target folder

(when (.exists release-folder)
  (delete! release-folder))

(.mkdirs release-folder)


;; create love file

(println "--> LOVE FILE <--")

(def love-file (io/file release-folder (str game-name ".love")))

(create-zip-file! src-folder love-file)
(println)


;; generic windows release creation functions

(defn windows-binary?
  [include-exe? file]
  (let [name (fname file)]
    (and (.isFile file)
         (or (.endsWith name ".dll")
             (and include-exe?
                  (= name "love.exe"))))))

(defn copy-sources
      [target-folder]
      (copy!
        src-folder
        (io/file target-folder (fname src-folder))))

(defn create-batch-file
  [target-folder]
  (spit
    (io/file target-folder (str "_RUN_ " game-name ".bat"))
    (str "love " \" (fname src-folder) \")))

(defn make-windows-release
  [binaries-dir loose?]
  (let [target (if loose? "win64-loose" "win64")
        love-exe (io/file binaries-dir "love.exe")]
    (if-not (.exists love-exe)
      (println "No love.exe found at " (.getCanonicalPath love-exe))
      (let [binaries (filter
                       #(windows-binary? loose? %)
                       (.listFiles binaries-dir))
            target-folder (io/file release-folder target)]
        (when (.exists target-folder)
          (delete! target-folder))
        (.mkdirs target-folder)
        ;; copy Love2D binaries
        (doseq [file binaries]
               (io/copy
                 file
                 (io/file target-folder (fname file))))
        ;; copy game files
        (if loose?
          (do (copy-sources target-folder)
              (create-batch-file target-folder))
          (concat-files
            love-exe love-file
            (io/file target-folder (str game-name ".exe"))))
        ;; zip up
        (create-zip-file!
          target-folder
          (io/file release-folder (str game-name " " target ".zip")))
        ;; delete temp folder
        (delete! target-folder)))))


;; create loose windows package

(println "--> LOOSE WINDOWS PACKAGE <--")
(make-windows-release love-win64 true)
(println)


;; create windows release

(println "--> WINDOWS RELEASE <--")
(make-windows-release love-win64 false)
(println)


(println "=== SUCCESS ===")
(println)

