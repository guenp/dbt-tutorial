SELECT
  UNNEST(ARG_MAX(oh, 'filename'))
FROM
  {{ ref('ticker_history') }} as oh
GROUP BY Symbol, Date