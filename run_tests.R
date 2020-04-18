testStatus <- dshelperfuns::CheckTestThatResults(devtools::test("ggchicago"))

if (!testStatus) {
    print("Tests have failed!")
    q(status = 1, save = "no")
}
