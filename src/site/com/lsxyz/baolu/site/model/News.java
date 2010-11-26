package com.lsxyz.baolu.site.model;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.Proxy;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.Set;

import static javax.persistence.GenerationType.IDENTITY;

@Entity
@Table(name="news")
@Proxy(lazy = false)
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class News implements Serializable{

	private static final long serialVersionUID = -1653774086997737434L;

	@Id
	@GeneratedValue
	private Integer id;
	private String title;
	private String content;
	private Date addTime;

	private Set<NewsFigures> figures;
	
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return id;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}
	
	@Column(name = "subject")
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	@Column(name = "content")
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	@Column(name="add_time")
	public Date getAddTime() {
		return addTime;
	}
	
	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}
	
	@OneToMany(mappedBy = "news",targetEntity= NewsFigures.class,cascade = CascadeType.ALL, fetch=FetchType.LAZY)
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	public Set<NewsFigures> getFigures() {
		return figures;
	}

	public void setFigures(Set<NewsFigures> figures) {
		this.figures = figures;
	}
	
}
