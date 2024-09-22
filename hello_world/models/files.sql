{{
    config(
        materialized="incremental",
        unique_key="id",
        pre_hook="""
        SET VARIABLE my_list = (SELECT array_agg(file) FROM glob('s3://us-prd-motherduck-open-datasets/stocks/**/*.csv'));
        """
    )
}}
select *
from read_csv(getvariable('my_list'), filename = true, union_by_name=true) as model
{% if is_incremental() %}
    where model.filename 
        not in (select distinct filename 
            from {{ this }} )
{% endif %}