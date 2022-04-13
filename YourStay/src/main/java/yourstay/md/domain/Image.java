package yourstay.md.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Image {
	private long iid;
	private String org_file_name;
	private String stored_file_name;
	private String file_path;
	private long aid;
}
