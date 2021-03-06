package br.com.consultemed.consulta.dao;

import java.time.LocalDate;
import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import br.com.consultemed.consulta.model.Consulta;
import br.com.consultemed.dao.GenericDAO;

//@Named(value="consultaDao")
public class ConsultaDao extends GenericDAO<Consulta, Long> {
//	
//	@Inject
//	private  EntityManager manager;
	
	public ConsultaDao() {
		super(Consulta.class);
	}

	public List<Consulta> buscarPorDataAgendamento(LocalDate agendamento) {
		Query query = this.manager.createQuery("SELECT c FROM Consulta c INNER JOIN c.agendamento as agen WHERE"
				+ " agen.dataAgendamento = :agendamento");
		query.setParameter("agendamento", agendamento);
		List<Consulta> entidades = query.getResultList();		
		
		return entidades;
	}
	
	public boolean existeConsultaComData(LocalDate dataAgendamento) {
		Query query = this.manager.createQuery("select case when (count(con) > 0) then true else false end "
				+ "from Consulta con INNER JOIN con.agendamento as agen"
				+ " where agen.dataAgendamento = :dataAgendamento");
		query.setParameter("dataAgendamento", dataAgendamento);
		
		boolean existe = (boolean) query.getSingleResult();
		return existe;
	}

//	@Override
//	protected EntityManager getEntityManager() {
//		// TODO Auto-generated method stub
//		return this.manager;
//	}
}
