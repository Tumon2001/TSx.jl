function Base.Broadcast.broadcasted(f, ts::TS)
    return TS(
        select(
            ts.coredata,
            :Index,
            Not(:Index) .=> (x -> f.(x)) => colname -> string(colname, "_", Symbol(f))
        )
    )
end
