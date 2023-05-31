package com.board.controller;

import com.board.model.Board;
import com.board.service.BoardService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;


@Controller
@RequiredArgsConstructor //생성자 주입
@RequestMapping("/board")
public class BoardController {

    private final BoardService boardService;

    //게시글 조회
    @GetMapping("/list")
    public String boardList(Model model, @PageableDefault Pageable pageable) throws Exception {

//        List<Board> boardList = boardService.list();
        model.addAttribute("boardList", boardService.pageList(pageable));


        return "board/index";
    }

    //게시글 작성
    @GetMapping("/write")
    public String boardWrite(){
        return "board/write";
    }

    @PostMapping("/list")
    public String boardWrite(@ModelAttribute Board board, HttpServletResponse response) throws Exception{
        boardService.write(board);
        response.sendRedirect("http://localhost:8080/board/list");

        return null;
    }

    //게시글 상세 조회
    @GetMapping("/list/{id}")
    public String detailBoard(@PathVariable Long id, Model model) throws Exception{
        Board detailBoard = boardService.detail(id);
        model.addAttribute("detailBoard", detailBoard);
        return "board/detail";
    }

    //게시글 수정
    @GetMapping("/list/edit/{id}")
    public String editBoard(@PathVariable Long id, Model model) throws Exception{
        Board editBoard = boardService.detail(id);
        model.addAttribute("editBoard", editBoard);
        return "board/edit";
    }

    @PostMapping("/list/edit/{id}")
    public  void updateBoard(@ModelAttribute Board board, HttpServletResponse response) throws Exception{
        boardService.write(board);
        response.sendRedirect("http://localhost:8080/board/list/");
    }


    //게시글 삭제
    @ResponseBody
    @GetMapping("/list/delete/{id}")
    public void deleteBoard(@PathVariable Long id, HttpServletResponse response) throws Exception{
        boardService.delete(id);
        response.sendRedirect("http://localhost:8080/board/list");
    }


}
