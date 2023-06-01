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

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class ComCostServiceImpl implements ComCostService {

    private final ComCostRepository comCostRepository;

    // 페이지별로 ComCost 엔티티를 조회하여 반환하는 메소드
    @Override
    public Page<ComCost> pageList(Pageable pageable){
        int page = (pageable.getPageNumber() == 0) ? 0 : (pageable.getPageNumber()-1);
        pageable = PageRequest.of(page, 10, Sort.by(Sort.Direction.DESC, "custCd"));
        return comCostRepository.findAll(pageable);
    }


    // 특정 키워드를 포함하는 ComCost 엔티티를 검색하여 페이지별로 반환하는 메소드
    @Override
    public Page<ComCost> searchByKeyword(String keyword, Pageable pageable) {
        return comCostRepository.searchByKeyword(keyword, pageable);
    }

    //    @Override
    //    public String write(ComCost comCost) throws Exception {
    //        ComCost write = comCostRepository.save(comCost);
    //        return write.getCustCd();
    //    }

    // ComCost 엔티티를 등록하는 메소드
    @Override
    public String write(ComCost comCost) throws Exception {

        // custCd 부분 생성
        String id = "CUST_";
        // 현재 날짜 가지고오기
        LocalDate localDate = LocalDate.now();
        // 날짜를 "yyyMMdd" 형식으로 포맷
        String nowLocalData = localDate.format(DateTimeFormatter.ofPattern("yyyyMMdd"));
        // 포맷된 날짜를 custCd에 추가
        id = id + nowLocalData;

        // 동일한 등록일자로 기존 데이터를 검색하기 위한 comCostDTO 객체 생성
        ComCost searchData = new ComCost();
        searchData.setRegDt(nowLocalData);
        // 동일한 등록일자를 가진 기존 ComCostDTO 객체의 총 개수 가져오기

        int i = comCostRepository.count(String.valueOf(searchData));
        // 개수를 문자열로 변환하고 선행 0이 포함된 형식으로 변환
        id = id + "_" + String.format("%03d", i).trim();

        // 생성된 custCd를 params 객체에 설정
        comCost.setCustCd(id);

        // ComCost 엔티티를 저장하고 저장된 객체 반환
        ComCost write = comCostRepository.save(comCost);

        return write.getCustCd();
    }

    // 특정 custCd에 해당하는 ComCost 엔티티를 조회하여 반환하는 메소드
    @Override
    public ComCost detail(String custCd) throws Exception{
        Optional<ComCost> comCost = comCostRepository.findById(custCd);
        return comCost.get();
    }


    // 특정 custCd에 해당하는 ComCost 엔티티를 삭제하는 메소드
    @Override
    public ComCost delete(String custCd) throws Exception {
        ComCost comCost = comCostRepository.findById(custCd)
                .orElseThrow(()-> new IllegalArgumentException("해당 게시글이 없습니다. custCd= " + custCd));
        comCostRepository.delete(comCost);
        return comCost;
    }

}
