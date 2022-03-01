import tensorflow as tf
xD = [1,2,3,4,5,6,7]
yD= [25000, 55000, 75000, 110000, 128000, 155000, 180000]
W=tf.Variable(tf.random_uniform([1], -100, 100))
b=tf.Variable(tf.random_uniform([1], -100, 100))
X = tf.placeholder(tf.float32)
Y = tf.placeholder(tf.float32)
H= W * X + b
cost = tf.reduce_mean(tf.square(H-Y))
a = tf.Variable(0.01)
optimizer = tf.train.GradientDescentOptimiter(a)
train = optimizer.minimize(cost)
sess = tf.Session()
sess.run(init)
for i in range(5001):
    sess.run(train, feed_dict= {X: xD, Y : yD})
    if i%500 == 0:
        print (i, sess.run(cost, feed_dict={X:xD, Y:yD}), sess.run(W), sess.run(b))
print (sess.run(H, feed_dict={X:[8]}))

