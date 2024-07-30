package dto;

public class MemberInfoAdminDTO {
	private String id;
	private String pwString;
	private String name;
	private int point;
	
	public MemberInfoAdminDTO(String id, String pwString, String name, int point) {
		this.id = id;
		this.pwString = pwString;
		this.name = name;
		this.point = point;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwString() {
		return pwString;
	}

	public void setPwString(String pwString) {
		this.pwString = pwString;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	@Override
	public String toString() {
		return "MemberInfoAdminDTO [id=" + id + ", pwString=" + pwString + ", name=" + name + ", point=" + point + "]";
	}
	
	
}
