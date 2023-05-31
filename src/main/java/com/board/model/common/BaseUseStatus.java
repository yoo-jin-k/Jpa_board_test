package com.board.model.common;

public enum BaseUseStatus {
    Y("사용"), N("미사용");

    private String title;

    BaseUseStatus(String title) {
        this.title = title;
    }

    public String getTitle() {
        return this.title;
    }

    public String getValue() {
        return super.toString();
    }
}
