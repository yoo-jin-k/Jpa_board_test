package com.board.repository;

import com.board.model.ComCost;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


public interface ComCostRepository extends JpaRepository<ComCost, String> {

    @Query("select count(*) from ComCost")
    int count(@Param("custCd") String custCd);
}
