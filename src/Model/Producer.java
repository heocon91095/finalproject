package Model;
// Generated Nov 26, 2016 9:09:39 PM by Hibernate Tools 5.1.0.Alpha1

/**
 * Producer generated by hbm2java
 */
public class Producer implements java.io.Serializable {

	private Integer producerid;
	private String producername;
	private String phone;
	private String address;
	private String producergroup;
	private String mail;

	public Producer() {
	}

	public Producer(String producername, String phone, String address, String producergroup, String mail) {
		this.producername = producername;
		this.phone = phone;
		this.address = address;
		this.producergroup = producergroup;
		this.mail = mail;
	}

	public Integer getProducerid() {
		return this.producerid;
	}

	public void setProducerid(Integer producerid) {
		this.producerid = producerid;
	}

	public String getProducername() {
		return this.producername;
	}

	public void setProducername(String producername) {
		this.producername = producername;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getProducergroup() {
		return this.producergroup;
	}

	public void setProducergroup(String producergroup) {
		this.producergroup = producergroup;
	}

	public String getMail() {
		return this.mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

}
