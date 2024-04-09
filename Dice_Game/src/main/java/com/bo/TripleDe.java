package com.bo;

import java.util.Random;

public class TripleDe {
	
	private int d1=-1;
	private int d2=-1;
	private int d3=-1;
	
		
	public int getD1() {
		return d1;
	}
	public int getD2() {
		return d2;
	}
	public int getD3() {
		return d3;
	}
	
	public void setD1(int d1) {
		this.d1 = d1;
	}
	public void setD2(int d2) {
		this.d2 = d2;
	}
	public void setD3(int d3) {
		this.d3 = d3;
	}
	
	
	public void generateD1() {
		int d1 = 1+new Random().nextInt(6);
		setD1(d1);
	}
	
	public void generateD2() {
		int d2 = 1+new Random().nextInt(6);
		setD2(d2);
	}
	
	public void generateD3() {
		int d3 = 1+new Random().nextInt(6);
		setD3(d3);
	}
	
	
	
	

}
