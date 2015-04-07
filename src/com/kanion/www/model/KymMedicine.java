package com.kanion.www.model;

public class KymMedicine {
    private Long id;

    private String name;

    private String spelling;

    private String functions;

    private String standard;

    private String property;

    private String pack;

    private String type;

    private String element;

    private String directions;

    private String adverseeffect;

    private String taboo;

    private String notes;

    private String clinicaltest;

    private String storage;

    private String toxicology;

    private String expirydate;

    private String executivestandard;

    private String approvalnumber;

    private String manufacturingenterprises;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getSpelling() {
        return spelling;
    }

    public void setSpelling(String spelling) {
        this.spelling = spelling == null ? null : spelling.trim();
    }

    public String getFunctions() {
        return functions;
    }

    public void setFunctions(String functions) {
        this.functions = functions == null ? null : functions.trim();
    }

    public String getStandard() {
        return standard;
    }

    public void setStandard(String standard) {
        this.standard = standard == null ? null : standard.trim();
    }

    public String getProperty() {
        return property;
    }

    public void setProperty(String property) {
        this.property = property == null ? null : property.trim();
    }

    public String getPack() {
        return pack;
    }

    public void setPack(String pack) {
        this.pack = pack == null ? null : pack.trim();
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public String getElement() {
        return element;
    }

    public void setElement(String element) {
        this.element = element == null ? null : element.trim();
    }

    public String getDirections() {
        return directions;
    }

    public void setDirections(String directions) {
        this.directions = directions == null ? null : directions.trim();
    }

    public String getAdverseeffect() {
        return adverseeffect;
    }

    public void setAdverseeffect(String adverseeffect) {
        this.adverseeffect = adverseeffect == null ? null : adverseeffect.trim();
    }

    public String getTaboo() {
        return taboo;
    }

    public void setTaboo(String taboo) {
        this.taboo = taboo == null ? null : taboo.trim();
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes == null ? null : notes.trim();
    }

    public String getClinicaltest() {
        return clinicaltest;
    }

    public void setClinicaltest(String clinicaltest) {
        this.clinicaltest = clinicaltest == null ? null : clinicaltest.trim();
    }

    public String getStorage() {
        return storage;
    }

    public void setStorage(String storage) {
        this.storage = storage == null ? null : storage.trim();
    }

    public String getToxicology() {
        return toxicology;
    }

    public void setToxicology(String toxicology) {
        this.toxicology = toxicology == null ? null : toxicology.trim();
    }

    public String getExpirydate() {
        return expirydate;
    }

    public void setExpirydate(String expirydate) {
        this.expirydate = expirydate == null ? null : expirydate.trim();
    }

    public String getExecutivestandard() {
        return executivestandard;
    }

    public void setExecutivestandard(String executivestandard) {
        this.executivestandard = executivestandard == null ? null : executivestandard.trim();
    }

    public String getApprovalnumber() {
        return approvalnumber;
    }

    public void setApprovalnumber(String approvalnumber) {
        this.approvalnumber = approvalnumber == null ? null : approvalnumber.trim();
    }

    public String getManufacturingenterprises() {
        return manufacturingenterprises;
    }

    public void setManufacturingenterprises(String manufacturingenterprises) {
        this.manufacturingenterprises = manufacturingenterprises == null ? null : manufacturingenterprises.trim();
    }
    
    public String toString(){
    	//type json
    	//Name Function Standard Element Directions Notes Expirydate Manufacture
    	return  "\"Name\":\""			+ this.getName()		+ "\""	+ "," + 
    			"\"Function\":\""		+ this.getFunctions()	+ "\""	+ "," + 
    			"\"Standard\":\""		+ this.getStandard()	+ "\""	+ "," +
    			"\"Element\":\""		+ this.getElement()		+ "\""	+ "," +
    			"\"Directions\":\""		+ this.getDirections()	+ "\""	+ "," +
    			//Note里有回车，js会报错
    			//"\"Notes\":\""			+ this.getNotes()		+ "\""	+ "," +
    			"\"Expirydate\":\""		+ this.getExpirydate()	+ "\""	+ "," +
    			"\"Manufacture\":\""	+ this.getManufacturingenterprises()+"\"";
    }
}