package domain;

public class Play {
	/*==============================================================
	create table play
	(
	   play_id              int not null auto_increment,
	   play_type_id         int,
	   play_lang_id         int,
	   play_name            varchar(200),
	   play_introduction    varchar(2000),
	   play_image           longblob,
	   play_length          int,
	   play_ticket_price    numeric(10,2),
	   play_status          smallint comment 'ȡֵ���壺
	            0���������ݳ�
	            1���Ѱ����ݳ�
	            -1������',
	   primary key (play_id)
	);*/
	
	private int id;
	private int typeId;
	private int langId;
	private String name;
	private String introduction;
	private String type;
	
	private String image; // ?? �鿴һ��longblob��Ӧjava������
	private int length;
	private float ticketPrice;
	private int status;
	
	private String director;
	private String mainactor;
	private String detailintro;
	public Play() {
		// TODO Auto-generated constructor stub
	}
	
	public Play(int id, int typeId, int langId, String name,
			String introduction, String image, int length, float ticketPrice,
			int status,String type) {
		super();
		this.id = id;
		this.typeId = typeId;
		this.langId = langId;
		this.name = name;
		this.introduction = introduction;
		this.image = image;
		this.length = length;
		this.ticketPrice = ticketPrice;
		this.status = status;
		this.type = type;
	}
	
	public Play(int id, int typeId, String name,
			String introduction, String image, int length, float ticketPrice,
			int status,String type) {
		super();
		this.id = id;
		this.typeId = typeId;
		this.name = name;
		this.introduction = introduction;
		this.image = image;
		this.length = length;
		this.ticketPrice = ticketPrice;
		this.status = status;
		this.type = type;
	}

	
	public Play(int id, int typeId, int langId, String name, String introduction, String type, String image, int length,
			float ticketPrice, int status, String director, String mainactor, String detailintro) {
		super();
		this.id = id;
		this.typeId = typeId;
		this.langId = langId;
		this.name = name;
		this.introduction = introduction;
		this.type = type;
		this.image = image;
		this.length = length;
		this.ticketPrice = ticketPrice;
		this.status = status;
		this.director = director;
		this.mainactor = mainactor;
		this.detailintro = detailintro;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getTypeId() {
		return typeId;
	}
	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}
	public int getLangId() {
		return langId;
	}
	public void setLangId(int langId) {
		this.langId = langId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getLength() {
		return length;
	}
	public void setLength(int length) {
		this.length = length;
	}
	public float getTicketPrice() {
		return ticketPrice;
	}
	public void setTicketPrice(float ticketPrice) {
		this.ticketPrice = ticketPrice;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public String getMainactor() {
		return mainactor;
	}

	public void setMainactor(String mainactor) {
		this.mainactor = mainactor;
	}

	public String getDetailintro() {
		return detailintro;
	}

	public void setDetailintro(String detailintro) {
		this.detailintro = detailintro;
	}
	
	
	
}
