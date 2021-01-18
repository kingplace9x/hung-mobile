package com.sale.cellphone.repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import com.sale.cellphone.dto.SearchDTO;
import com.sale.cellphone.entities.SanPham;

@Repository
public class SearchRepository {

	@PersistenceContext
	private EntityManager entityManager;
	
	
	public Page<SanPham> findBySeachDTO(SearchDTO dto, Pageable pageable){
		
		boolean enableName = false;
		StringBuilder findQueryStr = new StringBuilder();
		StringBuilder countQueryStr = new StringBuilder();
		String orderBy = "";
		findQueryStr.append("FROM com.sale.cellphone.entities.SanPham SP where 1=1 ");
		countQueryStr.append("Select count(SP.idSanPham) FROM com.sale.cellphone.entities.SanPham SP where 1=1 ");
		
		if(dto.getName() != null) {
			findQueryStr.append(" AND SP.name LIKE :name");
			countQueryStr.append(" AND SP.name LIKE :name");
			enableName = true;
			orderBy = " ORDER BY SP.name";
		}
		
		if(dto.getMinPrice()!=null && dto.getMaxPrice()==null) {
			findQueryStr.append(" AND SP.price >= " + dto.getMinPrice());
			countQueryStr.append(" AND SP.price >= " + dto.getMinPrice());
			orderBy = " ORDER BY SP.price";
		}
		
		if(dto.getMinPrice()==null && dto.getMaxPrice()!=null) {
			findQueryStr.append(" AND SP.price >= " + dto.getMaxPrice());
			countQueryStr.append(" AND SP.price >= " + dto.getMaxPrice());
			orderBy = " ORDER BY SP.price";

		}
		if(dto.getMinPrice()!=null && dto.getMaxPrice()!=null) {
			findQueryStr.append(" AND SP.price between " + dto.getMinPrice() +" AND " + dto.getMaxPrice());
			countQueryStr.append(" AND SP.price between " + dto.getMinPrice() +" AND " + dto.getMaxPrice());
			orderBy = " ORDER BY SP.price";
		}
		
		if(dto.getIdHang() != null && dto.getIdHang() > 0 ) {
			findQueryStr.append(" AND SP.idHang = " + dto.getIdHang());
			countQueryStr.append(" AND SP.idHang = " + dto.getIdHang());
			orderBy = " ORDER BY SP.name";
		}
		
		findQueryStr.append(orderBy);
			
		TypedQuery<SanPham> findQuery = entityManager.createQuery(findQueryStr.toString(), SanPham.class);
		TypedQuery<Long> countQuery = entityManager.createQuery(countQueryStr.toString(), Long.class);
		
		
		if(enableName) {
			findQuery.setParameter("name", "%" + dto.getName() +"%");
			countQuery.setParameter("name", "%" + dto.getName() +"%");
		}
		
		findQuery.setMaxResults(20);
		findQuery.setFirstResult(20*pageable.getPageNumber());
		
		return new PageImpl<SanPham>(findQuery.getResultList(),pageable,countQuery.getSingleResult());
	}
	
}
