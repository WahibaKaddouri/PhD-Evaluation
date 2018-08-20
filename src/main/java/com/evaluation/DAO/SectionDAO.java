package com.evaluation.DAO;


import com.evaluation.models.Section;

import java.util.List;

public interface SectionDAO {

     List<Section> getAllSection();
     int getSectionId(String section);
}
