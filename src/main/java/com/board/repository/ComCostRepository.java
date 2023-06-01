package com.board.repository;

import com.board.model.ComCost;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;


public interface ComCostRepository extends JpaRepository<ComCost, String> {

    // ComCost 엔티티의 전체 레코드 수를 반환하는 메소드
    @Query("select count(*) from ComCost")
    int count(@Param("custCd") String custCd);

    // 특정 키워드를 포함하는 ComCost 엔티티를 검색하여 페이지별로 반환하는 메소드
    @Query("SELECT c FROM ComCost c WHERE c.custCd LIKE %:keyword% OR c.custNm LIKE %:keyword%")
    Page<ComCost> searchByKeyword(@Param("keyword") String keyword, Pageable pageable);

}
