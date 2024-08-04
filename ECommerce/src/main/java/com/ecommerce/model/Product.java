package com.ecommerce.model;

public class Product {
    public Product(int id, String name, double price, String image,String category) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.image = image;
		this.category = category;
	}
    public Product(int id, String name, double price, String image) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.image = image;
	}
	private int id;
    private String name;
    private double price;
    private String image;
    private String category;
    private String description;
    private int quantity;
    private String size;

    public Product(int id, String name, double price, String image, String category, String description, String size) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.image = image;
        this.category = category;
        this.description = description;
        this.size = size;
    }
    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public Product(int id, String name, double price, String image, String category, String description) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.image = image;
        this.category = category;
        this.description = description;
    }

    public Product() {
		// TODO Auto-generated constructor stub
	}

	public Product(int id, String name, String image, double price, int quantity,String size) {
		this.id = id;
        this.name = name;
        this.price = price;
        this.image = image;
        this.quantity=quantity;
        this.size=size;
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

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
    	 this.category = category;
    }
    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    public Product withQuantity(int quantity) {
        Product newProduct = new Product(this.id, this.name, this.price, this.image, this.category, this.description);
        newProduct.setQuantity(quantity);
        return newProduct;
    }
}
