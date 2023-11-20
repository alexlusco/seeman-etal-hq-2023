import pandas as pd
from pmaw import PushshiftAPI
import datetime as dt
import string
import numpy as np

api = PushshiftAPI()

before = int(dt.datetime(2022, 8, 1, 0, 0).timestamp())

after = int(dt.datetime(2020, 12, 14, 0, 0).timestamp())

subreddits = pd.read_csv('./data/raw/subreddits.csv', sep = ',').values

limit = float('inf')

fields = ['body', 'author', 'created_utc', 'id', 'link_id', 'parent_id', 'subreddit', 'subreddit_id']

queries = pd.read_csv('./data/raw/query_terms.csv', sep = ',').values

for q in queries:
  
  comments = api.search_comments(q = q, subreddit = subreddits, limit = limit, before = before, after = after, fields = fields, metadata = True)
  
  comments_df = pd.DataFrame(comments)
  
  comments_df.to_csv('./data/raw/'+str(q).strip('"')+'_comments.csv', header=True, index=False)
  
    return comment_df
