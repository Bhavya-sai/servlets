package com.model;

public class Request 
{
	 private int id;
	    private String name;
	    private String email;
	    private String message;
	    private String submitedat;
	    private String status;
	    
	    public Request () {}

	    public Request(int id, String name, String email, String message, String submitedat,String status) {
	        this.id = id;
	        this.name = name;
	        this.email = email;
	        this.message = message;
	        this.submitedat = submitedat;
	        this.status = status;
	    }


	    public int getId() {
	        return id;
	    }

	    public void setId(int id) {
	        this.id = id;
	    }

	    public String getName() {
	        return name;
	    }

	    public void setName(String name) {
	        this.name = name;
	    }

	    public String getEmail() {
	        return email;
	    }

	    public void setEmail(String email) {
	        this.email = email;
	    }

	    public String getMessage() {
	        return message;
	    }

	    public void setMessage(String message) {
	        this.message = message;
	    }

	    public String getStatus() {
	        return status;
	    }

	    public void setStatus(String status) {
	        this.status = status;
	    }


		public String getSubmitedat() {
			return submitedat;
		}


		public void setSubmitedat(String submitedat) {
			this.submitedat = submitedat;
		}


}