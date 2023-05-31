package com.board.service;

import com.board.model.Board;
import com.board.model.ComCost;
import com.board.repository.ComCostRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
@RequiredArgsConstructor
public class ComCostServiceImpl implements ComCostService {

    private final ComCostRepository comCostRepository;

    @Override
    public Page<ComCost> pageList(Pageable pageable){
        int page = (pageable.getPageNumber() == 0) ? 0 : (pageable.getPageNumber()-1);
        pageable = PageRequest.of(page, 10, Sort.by(Sort.Direction.DESC, "custCd"));
        return comCostRepository.findAll(pageable);
    }

    @Override
    public String write(ComCost comCost) throws Exception {
        ComCost write = comCostRepository.save(comCost);
        return write.getCustCd();
    }

    @Override
    public ComCost detail(String custCd) throws Exception{
        Optional<ComCost> comCost = comCostRepository.findById(custCd);
        return comCost.get();
    }


    @Override
    public ComCost delete(String custCd) throws Exception {
        ComCost comCost = comCostRepository.findById(custCd)
                .orElseThrow(()-> new IllegalArgumentException("해당 게시글이 없습니다. custCd= " + custCd));
        comCostRepository.delete(comCost);
        return comCost;
    }

}
