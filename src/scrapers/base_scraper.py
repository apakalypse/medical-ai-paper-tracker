from abc import ABC, abstractmethod
from datetime import datetime
from typing import List, Dict, Optional

class BaseScraper(ABC):
    def __init__(self):
        self.last_update = None

    @abstractmethod
    async def search_papers(self, query: str, from_date: Optional[datetime] = None) -> List[Dict]:
        """Search for papers matching the query"""
        pass

    @abstractmethod
    async def download_paper(self, paper_id: str, save_path: str) -> bool:
        """Download paper PDF and return success status"""
        pass

    @abstractmethod
    async def get_citations(self, paper_id: str) -> Dict:
        """Get paper citations in BibTeX and EndNote formats"""
        pass

    def _validate_paper(self, paper: Dict) -> bool:
        """Validate paper has required fields"""
        required = ['id', 'title', 'authors', 'abstract', 'publication_date']
        return all(field in paper for field in required)

    def _format_date(self, date: datetime) -> str:
        """Format date consistently"""
        return date.isoformat()