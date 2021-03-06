package Model;
// Generated Nov 27, 2016 10:26:32 PM by Hibernate Tools 5.1.0.Alpha1

/**
 * Product generated by hbm2java
 */
public class Product implements java.io.Serializable {

	private Integer productid;
	private String productname;
	private String unit;
	private String producer;
	private String supiler;
	private String groupid;
	private String prductimg;
	private String note;
	private int pricein;
	private int priceout;
	private int vat;
	private String detail;

	public Product() {
	}

	public Product(String productname, String unit, String producer, String supiler, int pricein, int priceout,
			int vat) {
		this.productname = productname;
		this.unit = unit;
		this.producer = producer;
		this.supiler = supiler;
		this.pricein = pricein;
		this.priceout = priceout;
		this.vat = vat;
	}

	public Product(String productname, String unit, String producer, String supiler, String groupid, String prductimg,
			String note, int pricein, int priceout, int vat, String detail) {
		this.productname = productname;
		this.unit = unit;
		this.producer = producer;
		this.supiler = supiler;
		this.groupid = groupid;
		this.prductimg = prductimg;
		this.note = note;
		this.pricein = pricein;
		this.priceout = priceout;
		this.vat = vat;
		this.detail = detail;
	}

	public Integer getProductid() {
		return this.productid;
	}

	public void setProductid(Integer productid) {
		this.productid = productid;
	}

	public String getProductname() {
		return this.productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	public String getUnit() {
		return this.unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public String getProducer() {
		return this.producer;
	}

	public void setProducer(String producer) {
		this.producer = producer;
	}

	public String getSupiler() {
		return this.supiler;
	}

	public void setSupiler(String supiler) {
		this.supiler = supiler;
	}

	public String getGroupid() {
		return this.groupid;
	}

	public void setGroupid(String groupid) {
		this.groupid = groupid;
	}

	public String getPrductimg() {
		return this.prductimg;
	}

	public void setPrductimg(String prductimg) {
		this.prductimg = prductimg;
	}

	public String getNote() {
		return this.note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public int getPricein() {
		return this.pricein;
	}

	public void setPricein(int pricein) {
		this.pricein = pricein;
	}

	public int getPriceout() {
		return this.priceout;
	}

	public void setPriceout(int priceout) {
		this.priceout = priceout;
	}

	public int getVat() {
		return this.vat;
	}

	public void setVat(int vat) {
		this.vat = vat;
	}

	public String getDetail() {
		return this.detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

}
