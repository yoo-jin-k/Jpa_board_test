package com.board.controller;

import com.board.model.Board;
import com.board.model.ComCost;
import com.board.service.ComCostService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;

@Controller
@RequiredArgsConstructor //생성자 주입
@RequestMapping("/comCost")
public class ComCostController {

    private final ComCostService comCostService;

    //게시글 조회
    @GetMapping("/list")
    public String comCostList(Model model, @PageableDefault Pageable pageable) throws Exception {

//        List<ComCost> comCostService = comCostService.list();
        model.addAttribute("comCostList", comCostService.pageList(pageable));

        return "comCost/index";
    }

    //게시글 작성
    @GetMapping("/write")
    public String comCostWrite(){
        return "comCost/write";
    }

    @PostMapping("/list")
    public String comCostWrite(@ModelAttribute ComCost comCost, HttpServletResponse response) throws Exception{
        comCostService.write(comCost);
        response.sendRedirect("http://localhost:8080/comCost/list");

        return null;
    }

    //게시글 상세 조회
    @GetMapping("/list/{custCd}")
    public String detailComCost(@PathVariable String custCd, Model model) throws Exception{
        ComCost detailComCost = comCostService.detail(custCd);
        model.addAttribute("detailComCost", detailComCost);
        return "comCost/detail";
    }

    //게시글 수정
    @GetMapping("/list/edit/{custCd}")
    public String editComCost(@PathVariable String custCd, Model model) throws Exception{
        ComCost editComCost = comCostService.detail(custCd);
        model.addAttribute("editComCost", editComCost);
        return "comCost/edit";
    }

    @PostMapping("/list/edit/{custCd}")
    public  void updateComCost(@ModelAttribute ComCost comCost, HttpServletResponse response) throws Exception{
        comCostService.write(comCost);
        response.sendRedirect("http://localhost:8080/comCost/list/");
    }


    //게시글 삭제
    @ResponseBody
    @GetMapping("/list/delete/{custCd}")
    public void deleteComCost(@PathVariable String custCd, HttpServletResponse response) throws Exception{
        comCostService.delete(custCd);
        response.sendRedirect("http://localhost:8080/comCost/list");
    }
}
