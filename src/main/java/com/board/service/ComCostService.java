package com.board.service;

import com.board.model.Board;
import com.board.model.ComCost;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface ComCostService {

    public Page<ComCost> pageList(Pageable pageable); //페이징 처리

    public String write(ComCost comCost) throws Exception; // 게시글 작성

    public ComCost detail(String custCd) throws  Exception; // 게시글 상세 보기

    public ComCost delete(String custCd) throws Exception; //게시글 삭제
}
