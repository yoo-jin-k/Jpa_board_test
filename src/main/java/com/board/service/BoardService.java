package com.board.service;

import com.board.model.Board;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;


public interface BoardService {

//     public List<Board> list() throws Exception; // 목록 조회

     public Page<Board> pageList(Pageable pageable); //페이징 처리

     public Long write(Board board) throws Exception; // 게시글 작성

     public Board detail(Long id) throws  Exception; // 게시글 상세 보기

     public Board delete(Long id) throws Exception; //게시글 삭제
}
