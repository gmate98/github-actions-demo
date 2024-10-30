#include <gtest/gtest.h>

int add(int a, int b) {
    return a + b;
}

int subtract(int a, int b) {
    return a - b;
}

TEST(AdditionTest, HandlesPositiveValuesForAddMethod) {
    EXPECT_EQ(add(2, 3), 5);
    EXPECT_EQ(add(0, 0), 0);
}

TEST(AdditionTest, HandlesNegativeValuesForAddMethod) {
    EXPECT_EQ(add(-1, 1), 0);
    EXPECT_EQ(add(-10, 10), 0);
}

TEST(AdditionTest, HandlesPositiveValuesForSubstractMethod) {
    EXPECT_EQ(subtract(3, 2), 1);
    EXPECT_EQ(subtract(0, 0), 0);
}

TEST(AdditionTest, HandlesNegativeValuesForSubstractMethod) {
    EXPECT_EQ(subtract(-1, 1), -2);
    EXPECT_EQ(subtract(-10, -10), 0);
    EXPECT_EQ(subtract(-1, -10), 9);
}

TEST(AdditionTest, AddedTest) {
    EXPECT_EQ(subtract(3, 2), 1);
    EXPECT_EQ(subtract(0, 0), 0);
}

int main(int argc, char **argv) {
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}
