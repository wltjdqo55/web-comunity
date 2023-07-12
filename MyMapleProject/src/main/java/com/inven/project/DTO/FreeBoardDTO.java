package com.inven.project.DTO;

public class FreeBoardDTO {
	int num;
	int comment;
	String category;
	String userTitle;
	String userName;
	String userId;
	String userPassword;
	String userNickName;
	String wtime;
	String boardContent;
	String img_file;
	String img_file1;
	String pub_file1;
	String pub_file2;
	int hit;
	int recommend;
	int fuckRecommend;
	String boardcategory;
	public String getBoardcategory() {
		return boardcategory;
	}
	public void setBoardcategory(String boardcategory) {
		this.boardcategory = boardcategory;
	}
	public int getComment() {
		return comment;
	}
	public void setComment(int comment) {
		this.comment = comment;
	}
	public int getFuckrecommend() {
		return fuckRecommend;
	}
	public void setFuckrecommend(int fuckRecommend) {
		this.fuckRecommend = fuckRecommend;
	}
	
	
	public int getRecommend() {
		return recommend;
	}
	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getCategory(){
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getUserTitle(){
		return userTitle;
	}
	public void setUserTitle(String userTitle) {
		this.userTitle = userTitle;
	}
	public String getUserName(){
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserId(){
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPassword(){
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserNickName(){
		return userNickName;
	}
	public void setUserNickName(String userNickName) {
		this.userNickName = userNickName;
	}
	public String getPub_file2(){
		return pub_file2;
	}
	public void setPub_file2(String pub_file2) {
		this.pub_file2 = pub_file2;
	}
	public String getImg_file(){
		return img_file;
	}
	public void setImg_file(String img_file) {
		this.img_file = img_file;
	}
	public String getImg_file1(){
		return img_file1;
	}
	public void setImg_file1(String img_file1) {
		this.img_file1 = img_file1;
	}
	public String getPub_file1(){
		return pub_file1;
	}
	public void setPub_file1(String pub_file1) {
		this.pub_file1 = pub_file1;
	}
	public String getWtime(){
		return wtime;
	}
	public void setWtime(String wtime) {
		this.wtime = wtime;
	}
	public String getBoardContent(){
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}

}
