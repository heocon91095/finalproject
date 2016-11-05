package Model;
// Generated Nov 4, 2016 7:00:29 AM by Hibernate Tools 5.1.0.Alpha1

/**
 * Productdetail generated by hbm2java
 */
public class Productdetail implements java.io.Serializable {

	private String productid;
	private String display;
	private String os;
	private String frontcam;
	private String backcam;
	private String cpu;
	private String ram;
	private String storage;
	private String sdcard;
	private String sim;
	private String battery;
	private String image;
	private String special;

	public Productdetail() {
	}

	public Productdetail(String productid, String display, String os, String frontcam, String backcam, String cpu,
			String ram, String storage, String sdcard, String sim, String battery) {
		this.productid = productid;
		this.display = display;
		this.os = os;
		this.frontcam = frontcam;
		this.backcam = backcam;
		this.cpu = cpu;
		this.ram = ram;
		this.storage = storage;
		this.sdcard = sdcard;
		this.sim = sim;
		this.battery = battery;
	}

	public Productdetail(String productid, String display, String os, String frontcam, String backcam, String cpu,
			String ram, String storage, String sdcard, String sim, String battery, String image, String special) {
		this.productid = productid;
		this.display = display;
		this.os = os;
		this.frontcam = frontcam;
		this.backcam = backcam;
		this.cpu = cpu;
		this.ram = ram;
		this.storage = storage;
		this.sdcard = sdcard;
		this.sim = sim;
		this.battery = battery;
		this.image = image;
		this.special = special;
	}

	public String getProductid() {
		return this.productid;
	}

	public void setProductid(String productid) {
		this.productid = productid;
	}

	public String getDisplay() {
		return this.display;
	}

	public void setDisplay(String display) {
		this.display = display;
	}

	public String getOs() {
		return this.os;
	}

	public void setOs(String os) {
		this.os = os;
	}

	public String getFrontcam() {
		return this.frontcam;
	}

	public void setFrontcam(String frontcam) {
		this.frontcam = frontcam;
	}

	public String getBackcam() {
		return this.backcam;
	}

	public void setBackcam(String backcam) {
		this.backcam = backcam;
	}

	public String getCpu() {
		return this.cpu;
	}

	public void setCpu(String cpu) {
		this.cpu = cpu;
	}

	public String getRam() {
		return this.ram;
	}

	public void setRam(String ram) {
		this.ram = ram;
	}

	public String getStorage() {
		return this.storage;
	}

	public void setStorage(String storage) {
		this.storage = storage;
	}

	public String getSdcard() {
		return this.sdcard;
	}

	public void setSdcard(String sdcard) {
		this.sdcard = sdcard;
	}

	public String getSim() {
		return this.sim;
	}

	public void setSim(String sim) {
		this.sim = sim;
	}

	public String getBattery() {
		return this.battery;
	}

	public void setBattery(String battery) {
		this.battery = battery;
	}

	public String getImage() {
		return this.image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getSpecial() {
		return this.special;
	}

	public void setSpecial(String special) {
		this.special = special;
	}

}
