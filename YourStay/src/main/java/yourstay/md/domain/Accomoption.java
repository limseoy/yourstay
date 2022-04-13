package yourstay.md.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Accomoption {
   private long oid;
   private long aid;
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

   
   
   @Override
   public String toString() {
      return "Accomoption [oid=" + oid + ", tnum=" + tnum + ", smoking=" + smoking + ", bbq = "+bbq+ "]";
   }
}