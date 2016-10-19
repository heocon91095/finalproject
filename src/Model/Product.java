package Model;
// Generated Oct 19, 2016 8:00:19 PM by Hibernate Tools 5.1.0.Alpha1

/**
 * Product generated by hbm2java
 */
public class Product implements java.io.Serializable {

	private Integer productid;
	private String prefix;
	private String productname;
	private String unit;
	private int producer;
	private int supiler;
	private String groupid;
	private String productimg;
	private String note;
	private Integer valuein;
	private Integer valueout;
	private Integer vat;
	private String detail;

	public Product() {
	}

	public Product(String unit, int producer, int supiler) {
		this.unit = unit;
		this.producer = producer;
		this.supiler = supiler;
	}

	public Product(String prefix, String productname, String unit, int producer, int supiler, String groupid,
			String productimg, String note, Integer valuein, Integer valueout, Integer vat, String detail) {
		this.prefix = prefix;
		this.productname = productname;
		this.unit = unit;
		this.producer = producer;
		this.supiler = supiler;
		this.groupid = groupid;
		this.productimg = productimg;
		this.note = note;
		this.valuein = valuein;
		this.valueout = valueout;
		this.vat = vat;
		this.detail = detail;
	}

	public Integer getProductid() {
		return this.productid;
	}

	public void setProductid(Integer productid) {
		this.productid = productid;
	}

	public String getPrefix() {
		return this.prefix;
	}

	public void setPrefix(String prefix) {
		this.prefix = prefix;
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

	public int getProducer() {
		return this.producer;
	}

	public void setProducer(int producer) {
		this.producer = producer;
	}

	public int getSupiler() {
		return this.supiler;
	}

	public void setSupiler(int supiler) {
		this.supiler = supiler;
	}

	public String getGroupid() {
		return this.groupid;
	}

	public void setGroupid(String groupid) {
		this.groupid = groupid;
	}

	public String getProductimg() {
		return this.productimg;
	}

	public void setProductimg(String productimg) {
		this.productimg = productimg;
	}

	public String getNote() {
		return this.note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public Integer getValuein() {
		return this.valuein;
	}

	public void setValuein(Integer valuein) {
		this.valuein = valuein;
	}

	public Integer getValueout() {
		return this.valueout;
	}

	public void setValueout(Integer valueout) {
		this.valueout = valueout;
	}

	public Integer getVat() {
		return this.vat;
	}

	public void setVat(Integer vat) {
		this.vat = vat;
	}

	public String getDetail() {
		return this.detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

}
