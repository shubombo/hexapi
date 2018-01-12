INSERT INTO public.temp("Uuid", "Atk", "SocketCount", "Artist", "Name", "Faction", "Color", "Rarity", "SetNumber", "Cost", "Health", "Text", "Type", "SubType", "EquipmentUuids", "WildThresholdCount","BloodThresholdCount","RubyThresholdCount","SapphireThresholdCount","DiamondThresholdCount")
	select
		cast(data::jsonb->>'uuid' as uuid),
		cast(data::jsonb->>'atk' as int),
		cast(data::jsonb->>'socket_count' as int),
		data::jsonb->>'artist',
		data::jsonb->>'name',
		data::jsonb->>'faction',
		case when jsonb_array_length(data::jsonb->'color') !='1' then 'Prismatic' else data::jsonb->'color'->>0 end,
		data::jsonb->>'rarity' ,
    	data::jsonb->>'set_number',
    	cast(data::jsonb->>'cost' as int),
    	cast(data::jsonb->>'health' as int),
    	data::jsonb->>'text',
		data::jsonb->'type',
		data::jsonb->>'sub_type',
    	data::jsonb->'equipment_uuids',
		case
    		when data::jsonb->'threshold'->0->'shard'='"Wild"' then data::jsonb->'threshold'->0->'quantity'
        	when data::jsonb->'threshold'->1->'shard'='"Wild"' then data::jsonb->'threshold'->1->'quantity'
        	when data::jsonb->'threshold'->2->'shard'='"Wild"' then data::jsonb->'threshold'->2->'quantity'
        	when data::jsonb->'threshold'->3->'shard'='"Wild"' then data::jsonb->'threshold'->3->'quantity'
        	when data::jsonb->'threshold'->4->'shard'='"Wild"' then data::jsonb->'threshold'->4->'quantity'
        else null end as WildThresholdCount,
    	case
    		when data::jsonb->'threshold'->0->'shard'='"Blood"' then data::jsonb->'threshold'->0->'quantity'
        	when data::jsonb->'threshold'->1->'shard'='"Blood"' then data::jsonb->'threshold'->1->'quantity'
        	when data::jsonb->'threshold'->2->'shard'='"Blood"' then data::jsonb->'threshold'->2->'quantity'
        	when data::jsonb->'threshold'->3->'shard'='"Blood"' then data::jsonb->'threshold'->3->'quantity'
        	when data::jsonb->'threshold'->4->'shard'='"Blood"' then data::jsonb->'threshold'->4->'quantity'
        else null end as BloodThresholdCount,
    	case
    		when data::jsonb->'threshold'->0->'shard'='"Ruby"' then data::jsonb->'threshold'->0->'quantity'
        	when data::jsonb->'threshold'->1->'shard'='"Ruby"' then data::jsonb->'threshold'->1->'quantity'
        	when data::jsonb->'threshold'->2->'shard'='"Ruby"' then data::jsonb->'threshold'->2->'quantity'
        	when data::jsonb->'threshold'->3->'shard'='"Ruby"' then data::jsonb->'threshold'->3->'quantity'
        	when data::jsonb->'threshold'->4->'shard'='"Ruby"' then data::jsonb->'threshold'->4->'quantity'
        else null end as RubyThresholdCount,
    	case
    		when data::jsonb->'threshold'->0->'shard'='"Sapphire"' then data::jsonb->'threshold'->0->'quantity'
        	when data::jsonb->'threshold'->1->'shard'='"Sapphire"' then data::jsonb->'threshold'->1->'quantity'
        	when data::jsonb->'threshold'->2->'shard'='"Sapphire"' then data::jsonb->'threshold'->2->'quantity'
        	when data::jsonb->'threshold'->3->'shard'='"Sapphire"' then data::jsonb->'threshold'->3->'quantity'
        	when data::jsonb->'threshold'->4->'shard'='"Sapphire"' then data::jsonb->'threshold'->4->'quantity'
        else null end as SapphireThresholdCount,
    case
    	when data::jsonb->'threshold'->0->'shard'='"Diamond"' then data::jsonb->'threshold'->0->'quantity'
        when data::jsonb->'threshold'->1->'shard'='"Diamond"' then data::jsonb->'threshold'->1->'quantity'
        when data::jsonb->'threshold'->2->'shard'='"Diamond"' then data::jsonb->'threshold'->2->'quantity'
        when data::jsonb->'threshold'->3->'shard'='"Diamond"' then data::jsonb->'threshold'->3->'quantity'
        when data::jsonb->'threshold'->4->'shard'='"Diamond"' then data::jsonb->'threshold'->4->'quantity'
        else null end as DiamondThresholdCount
	from public.objects;
