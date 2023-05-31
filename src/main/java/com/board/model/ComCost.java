package com.board.model;

import com.board.model.common.BaseUseStatus;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@Entity
@Table(name = "TB_COM_CUST")
public class ComCost {

    @Id
    @GeneratedValue(strategy = GenerationType.TABLE, generator = "COST_SEQ_GENERATOR")
    @Column(name = "CUST_CD")
    private String custCd;

    @Column(name = "BIZ_CD")
    private String bizCd;

    @Column(name = "CUST_NM")
    private String custNm;
    @Column(name = "ABBR_NM")
    private String abbrNm;
    @Column(name = "BIZREG_NO")
    private String bizregNo;
    @Column(name = "BIZ_TYPE")
    private String bizType;
    @Column(name = "CEO_NM")
    private String ceoNm;
    @Column(name = "COMP_NM")
    private String compNm;
    @Column(name = "ADDR1")
    private String addr1;
    @Column(name = "ADDR2")
    private String addr2;
    @Column(name = "ZIP_CD")
    private String zipCd;
    @Column(name = "TEL1")
    private String tel1;
    @Column(name = "TEL2")
    private String tel2;
    @Column(name = "FAX")
    private String fax;
    @Column(name = "EMAIL")
    private String email;
    @Column(name = "ORDER_NUM")
    private Integer orderNum;
    @Column(name = "RMK")
    private String rmk;
    /**
     * 사용여부
     * */
    @Enumerated(EnumType.STRING)
    @Column(name = "USE_YN", columnDefinition = "CHAR")
    private BaseUseStatus useYn;

    /**
     * 삭제여부
     */
    @Enumerated(EnumType.STRING)
    @Column(name = "DEL_YN", columnDefinition = "CHAR")
    private BaseUseStatus delYn;

    @Column(name = "REG_ID")
    private String regId;
    @Column(name = "REG_DT")
    private String regDt;
    @Column(name = "MOD_ID")
    private String modId;

    @Column(name = "MOD_DT")
    private String modDt;
    @Column(name = "PIC_NM")
    private String picNm;
    @Column(name = "PIC_TEL")
    private String picTel;
}
