package Model;
// Generated Nov 21, 2016 9:24:55 PM by Hibernate Tools 5.1.0.Alpha1

/**
 * Warehousedetail generated by hbm2java
 */
public class Warehousedetail implements java.io.Serializable {

	private WarehousedetailId id;
	private String productname;
	private int number;
	private int unitprice;
	private int totalprice;

	public Warehousedetail() {
	}

	public Warehousedetail(WarehousedetailId id, String productname, int number, int unitprice, int totalprice) {
		this.id = id;
		this.productname = productname;
		this.number = number;
		this.unitprice = unitprice;
		this.totalprice = totalprice;
	}

	public WarehousedetailId getId() {
		return this.id;
	}

	public void setId(WarehousedetailId id) {
		this.id = id;
	}

	public String getProductname() {
		return this.productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	public int getNumber() {
		return this.number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public int getUnitprice() {
		return this.unitprice;
	}

	public void setUnitprice(int unitprice) {
		this.unitprice = unitprice;
	}

	public int getTotalprice() {
		return this.totalprice;
	}

	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}

}
