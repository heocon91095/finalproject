package Model;
// Generated Nov 27, 2016 10:26:32 PM by Hibernate Tools 5.1.0.Alpha1

/**
 * Billdetail generated by hbm2java
 */
public class Billdetail implements java.io.Serializable {

	private BilldetailId id;
	private String productname;
	private int number;
	private int unitprice;
	private int totalprice;

	public Billdetail() {
	}

	public Billdetail(BilldetailId id, String productname, int number, int unitprice, int totalprice) {
		this.id = id;
		this.productname = productname;
		this.number = number;
		this.unitprice = unitprice;
		this.totalprice = totalprice;
	}

	public BilldetailId getId() {
		return this.id;
	}

	public void setId(BilldetailId id) {
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
