package Model;
// Generated Nov 21, 2016 9:24:55 PM by Hibernate Tools 5.1.0.Alpha1

/**
 * WarehousedetailId generated by hbm2java
 */
public class WarehousedetailId implements java.io.Serializable {

	private int wid;
	private String productid;

	public WarehousedetailId() {
	}

	public WarehousedetailId(int wid, String productid) {
		this.wid = wid;
		this.productid = productid;
	}

	public int getWid() {
		return this.wid;
	}

	public void setWid(int wid) {
		this.wid = wid;
	}

	public String getProductid() {
		return this.productid;
	}

	public void setProductid(String productid) {
		this.productid = productid;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof WarehousedetailId))
			return false;
		WarehousedetailId castOther = (WarehousedetailId) other;

		return (this.getWid() == castOther.getWid())
				&& ((this.getProductid() == castOther.getProductid()) || (this.getProductid() != null
						&& castOther.getProductid() != null && this.getProductid().equals(castOther.getProductid())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result + this.getWid();
		result = 37 * result + (getProductid() == null ? 0 : this.getProductid().hashCode());
		return result;
	}

}
