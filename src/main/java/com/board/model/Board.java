package com.board.model;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.time.LocalDateTime;

@Getter
@Setter
@Entity
@Table(name = "board")
public class Board extends BaseTimeEntity {

    @Id
    @Column(name = "bno")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String title;

    private String name;

    @Lob
    private String content;


    @Builder
    public Board(String title, String content, String name){
        this.title = title;
        this.content = content;
        this.name = name;
    }

    public Board() {

    }
}
