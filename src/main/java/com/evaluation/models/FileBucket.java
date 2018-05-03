package com.evaluation.models;

import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;


public class FileBucket {

    MultipartFile file;




    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }
}
