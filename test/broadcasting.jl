as = rand(-10000:10000, 100) / 77
bs = rand(-10000:10000, 100) / 77
ts = TS(DataFrame(Index = 1:100, A = as, B = bs))

# testing sin function
sin_ts = sin.(ts)
@test typeof(sin_ts) == TS
@test ts[:, :Index] == sin_ts[:, :Index]
for i in 1:100
    @test sin_ts[i, :A_sin] == sin(ts[i, :A])
    @test sin_ts[i, :B_sin] == sin(ts[i, :B])
end

# testing log function on one column
log_ts_A = log.(Complex.(ts[:, [:A]]))
@test typeof(log_ts_A) == TS
@test ts[:, :Index] == log_ts_A[:, :Index]
for i in 1:100
    @test log_ts_A[i, :A_Complex_log] == log(Complex(ts[i, :A]))
end

