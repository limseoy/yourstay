package yourstay.md.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class resultVO {
   //accommodation
   private long aid;
   private String aname;
   private String aloc;
   private long aprice;
   private long apoint;
   private String atype;
   private int apeople;
   private int iid;
   private long mseq;
   private String anotice;
   private String amap;
   //accomoption
   private long oid;
   private long rnum;
   private int wifi;
   private int tnum;
   private int bnum;
   private int wave;
   private int refg;
   private int bd;
   private int tv;
   private int pet;
   private int kitchen;
   private int wash;
   private int parking;
   private int fire;
   private int smoking;
   private int roof;
   private int bbq;
   //utility
   private long utid;
   private String ures;
   private String ucafe;
   private String ucon;
   private String uact;
   //member
   private String mname;
   private String memail;
   private String mpwd;
   private int mcallnum;
   private int mstate;
   //review
   private long renum;
   private int point;
   private String review;
   private String rstart;
   private String rend;
   private long days;//추가
   private long resultprice;//추가

   //image
   private String ipath1;
   private String ipath2;
   private String ipath3;
}