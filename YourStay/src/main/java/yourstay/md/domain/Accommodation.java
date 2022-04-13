package yourstay.md.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Accommodation {
   //accommodation
   private long aid;
   private String aname;
   private String aloc;
   private long aprice;
   private long apoint;
   private String atype;
   private int apeople;
   private long iid;
   private long mseq;
   private String anotice;
   private String amap;
   //accommoption
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
   //image
   private String ipath1;
   private String ipath2;
   private String ipath3;
   //member
   private String memail;
}
