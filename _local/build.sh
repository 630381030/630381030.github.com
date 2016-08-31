#!/bin/sh

files=`ls *.md`
echo "The file list: $files"
date=`date "+%Y-%m-%d %H:%M:%S"`
_posts="./_posts/"
categories=$1
tags=$2
for file in $files
do
  echo "building $file"
  echo "---" >> "$_posts/$file"
  echo "title: ${file%%.md}" >> "$_posts/$file"
  echo "date: $date" >> "$_posts/$file"
  echo "categories: [$categories]" >> "$_posts/$file"
  echo "tags: [$tags]" >> "$_posts/$file"
  echo "---" >> "$_posts/$file"
  cat $file >> "$_posts/$file"
  rm -f $file
done
