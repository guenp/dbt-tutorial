SELECT
  UNNEST(ARG_MAX(oh, 'filename'))
FROM
  {{ ref('ticker_info') }} as oh
GROUP BY Symbol