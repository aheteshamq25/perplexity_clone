from typing import List
from sentence_transformers import SentenceTransformer
import numpy as np

class SortSourceService:
    
    def __init__(self):
        self.embadding_model = SentenceTransformer("all-MiniLM-L6-v2")

    def sort_sources(self, query: str, search_results: List[dict]):
        relevent_doc = []
        query_embedding = self.embadding_model.encode(query)

        for res in search_results:
            content = res.get("content") or ""
            if not content:
                continue
            res_embedding = self.embadding_model.encode(content)

            similarity_score = float(np.dot(query_embedding , res_embedding)/(np.linalg.norm(query_embedding)* np.linalg.norm(res_embedding)))

            res["relevence_score"] = similarity_score

            if similarity_score > 0.3:
                relevent_doc.append(
                    res
                )
        return sorted(relevent_doc , key=lambda x: x['relevence_score'] , reverse=True)