package dto;

public class MemberInfoDTO {
	private String name;
	private int point;
	
	public MemberInfoDTO(String name, int point) {
		this.name = name;
		this.point = point;
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
		return "MemberInfoDTO [name=" + name + ", point=" + point + "]";
	}
	
}
