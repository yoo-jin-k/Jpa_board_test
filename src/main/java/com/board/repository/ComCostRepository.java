package com.board.repository;

import com.board.model.ComCost;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;


public interface ComCostRepository extends JpaRepository<ComCost, String> {

    @Query("select count(*) from ComCost")
    int count(@Param("custCd") String custCd);

    @Query("SELECT c FROM ComCost c WHERE c.custCd LIKE %:keyword% OR c.custNm LIKE %:keyword%")
    Page<ComCost> searchByKeyword(@Param("keyword") String keyword, Pageable pageable);

}
