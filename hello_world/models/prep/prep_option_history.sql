SELECT
  UNNEST(ARG_MAX(oh, 'filename'))
FROM
  {{ ref('option_history') }} as oh
GROUP BY contractSymbol
