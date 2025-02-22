package java_days07.guestbook.domain;

public class Message {

	// fields == table column name
	private int message_id;
	private String guest_name;
	private String password;
	private String message;

	// getter, setter
	public int getMessage_id() {
		return message_id;
	}
	public void setMessage_id(int message_id) {
		this.message_id = message_id;
	}
	public String getGuest_name() {
		return guest_name;
	}
	public void setGuest_name(String guest_name) {
		this.guest_name = guest_name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}

	// 추가
	public boolean hasPassword() {
		return password != null && !password.isEmpty();
	}

	// 추가
	public boolean matchPassword(String password) {
		return this.password != null && this.password.equals(password);
	}

}
