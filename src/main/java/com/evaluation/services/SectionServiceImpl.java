package com.evaluation.services;

import com.evaluation.DAO.SectionDAOImpl;
import com.evaluation.models.Section;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class SectionServiceImpl implements SectionService {

    @Autowired
    private SectionDAOImpl SectionDAO;
    public List<Section> getAllSection() {
        return SectionDAO.getAllSection();
    }
    public int getSectionId(String section){return SectionDAO.getSectionId(section);}
}
