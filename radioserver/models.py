from sqlalchemy import Column, Integer, String, DateTime
from datetime import datetime
from radioserver.database import Base

class Programme(Base):
    __tablename__ = 'programmes'
    id  = Column(Integer, primary_key=True)
    url = Column(String(1023))
    created_at = Column(DateTime, default=datetime.now)

    def __init__(self, url):
        self.url = url

    def __repr__(self):
        return '<Programme %s>' % self.url

    def as_json(self):
        return { 'url': self.url }
